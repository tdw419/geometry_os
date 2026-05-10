; DESCRIPTION: Creates a white filled rectangle of size 72x59 starting at (7, 41).
; PLAN: r0=7(x), r1=41(y), r2=72(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 41
LDI r2, 72
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
