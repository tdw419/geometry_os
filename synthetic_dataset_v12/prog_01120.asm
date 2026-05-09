; DESCRIPTION: Composite: Renders a green disk with center (384, 168) and radius 32 then Renders a green box of size 106x37 starting at (346, 22).
; PLAN: r0=384(x), r1=168(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x), r6=22(y), r7=106(width), r8=37(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 384
LDI r1, 168
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 22
LDI r7, 106
LDI r8, 37
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
