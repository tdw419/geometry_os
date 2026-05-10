; DESCRIPTION: Renders a red box of size 44x49 starting at (295, 148).
; PLAN: r0=295(x), r1=148(y), r2=44(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 148
LDI r2, 44
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
