; DESCRIPTION: Creates a purple rectangular region at (87, 129) spanning 12 by 40 pixels.
; PLAN: r0=87(x), r1=129(y), r2=12(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 129
LDI r2, 12
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
