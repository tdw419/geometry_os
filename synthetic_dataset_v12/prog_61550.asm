; DESCRIPTION: Renders a red box of size 21x25 starting at (161, 210).
; PLAN: r0=161(x), r1=210(y), r2=21(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 210
LDI r2, 21
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
