; DESCRIPTION: Composite: . Then Creates a black rectangular region at (169, 133) spanning 32 by 83 pixels. Then Renders a white disk with center (130, 231) and radius 16.
; PLAN: r0=169(x), r1=133(y), r2=32(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=130(x), r1=231(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a black rectangular region at (169, 133) spanning 32 by 83 pixels.
; PLAN: r0=169(x), r1=133(y), r2=32(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 133
LDI r2, 32
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white disk with center (130, 231) and radius 16.
; PLAN: r0=130(x), r1=231(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 231
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
