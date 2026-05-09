; DESCRIPTION: Creates a red rectangular region at (135, 48) spanning 20 by 80 pixels.
; PLAN: r0=135(x), r1=48(y), r2=20(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 48
LDI r2, 20
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
