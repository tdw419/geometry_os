; DESCRIPTION: Creates a cyan rectangular region at (83, 129) spanning 80 by 83 pixels.
; PLAN: r0=83(x), r1=129(y), r2=80(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 129
LDI r2, 80
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
