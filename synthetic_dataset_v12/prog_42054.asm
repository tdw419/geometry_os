; DESCRIPTION: Composite: Renders a magenta box of size 82x67 starting at (222, 129) then Renders a green disk with center (327, 82) and radius 71.
; PLAN: r0=222(x), r1=129(y), r2=82(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x), r6=82(y), r7=71(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 222
LDI r1, 129
LDI r2, 82
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 82
LDI r7, 71
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
