; DESCRIPTION: Renders a red box of size 68x56 starting at (428, 192).
; PLAN: r0=428(x), r1=192(y), r2=68(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 192
LDI r2, 68
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
