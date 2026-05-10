; DESCRIPTION: Creates a orange filled rectangle of size 59x79 starting at (215, 107).
; PLAN: r0=215(x), r1=107(y), r2=59(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 107
LDI r2, 59
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
