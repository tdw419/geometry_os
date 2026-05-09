; DESCRIPTION: Creates a green rectangular region at (412, 129) spanning 77 by 25 pixels.
; PLAN: r0=412(x), r1=129(y), r2=77(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 129
LDI r2, 77
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
