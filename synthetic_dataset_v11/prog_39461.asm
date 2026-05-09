; DESCRIPTION: Renders a red box of size 55x83 starting at (112, 152).
; PLAN: r0=112(x), r1=152(y), r2=55(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 152
LDI r2, 55
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
