; DESCRIPTION: Composite: . Then Creates a black rectangular region at (76, 152) spanning 21 by 58 pixels. Then Places a blue dot at position (132, 253).
; PLAN: r0=76(x), r1=152(y), r2=21(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=132(x), r1=253(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black rectangular region at (76, 152) spanning 21 by 58 pixels.
; PLAN: r0=76(x), r1=152(y), r2=21(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 152
LDI r2, 21
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (132, 253).
; PLAN: r0=132(x), r1=253(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 132
LDI r1, 253
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
