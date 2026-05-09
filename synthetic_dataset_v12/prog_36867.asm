; DESCRIPTION: Creates a purple circular shape at (295, 116) with radius 27.
; PLAN: r0=295(x), r1=116(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 116
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
