; DESCRIPTION: Renders a red box of size 21x26 starting at (367, 160).
; PLAN: r0=367(x), r1=160(y), r2=21(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 160
LDI r2, 21
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
