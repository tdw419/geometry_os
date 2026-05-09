; DESCRIPTION: Creates a orange rectangular region at (215, 180) spanning 39 by 29 pixels.
; PLAN: r0=215(x), r1=180(y), r2=39(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 180
LDI r2, 39
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
