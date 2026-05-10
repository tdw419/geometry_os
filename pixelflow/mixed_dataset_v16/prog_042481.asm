; DESCRIPTION: Composite: Places a blue dot at position (245, 38) then Renders a magenta disk with center (413, 87) and radius 65 then Creates a purple rectangular region at (365, 90) spanning 48 by 64 pixels.
; PLAN: r0=245(x), r1=38(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=87(y), r7=65(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=365(x), r11=90(y), r12=48(width), r13=64(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 38
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 413
LDI r6, 87
LDI r7, 65
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 365
LDI r11, 90
LDI r12, 48
LDI r13, 64
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
