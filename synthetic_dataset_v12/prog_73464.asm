; DESCRIPTION: Renders a red box of size 99x25 starting at (87, 214).
; PLAN: r0=87(x), r1=214(y), r2=99(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 214
LDI r2, 99
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
