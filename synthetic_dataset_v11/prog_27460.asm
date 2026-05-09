; DESCRIPTION: Creates a cyan circular shape at (135, 129) with radius 59.
; PLAN: r0=135(x), r1=129(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 129
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
