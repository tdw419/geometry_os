; DESCRIPTION: Composite: Renders a green disk with center (231, 168) and radius 39 then Places a black dot at position (186, 171) then Renders a magenta box of size 72x86 starting at (7, 111).
; PLAN: r0=231(x), r1=168(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=186(x), r6=171(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=7(x), r11=111(y), r12=72(width), r13=86(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 168
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 186
LDI r6, 171
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 7
LDI r11, 111
LDI r12, 72
LDI r13, 86
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
