; DESCRIPTION: Composite: Places a red dot at position (272, 166) then Renders a orange disk with center (236, 91) and radius 79 then Places a green 53x82 rectangle at position (273, 109).
; PLAN: r0=272(x), r1=166(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=236(x), r6=91(y), r7=79(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=273(x), r11=109(y), r12=53(width), r13=82(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 166
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 236
LDI r6, 91
LDI r7, 79
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 273
LDI r11, 109
LDI r12, 53
LDI r13, 82
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
