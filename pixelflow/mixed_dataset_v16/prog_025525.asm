; DESCRIPTION: Composite: Places a red circle of radius 70 at center (107, 102) then Sets a single magenta pixel at (254, 245) then Renders a cyan line between points (96, 250) and (346, 113).
; PLAN: r0=107(x), r1=102(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x), r6=245(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=96(x1), r11=250(y1), r12=346(x2), r13=113(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 102
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 245
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 96
LDI r11, 250
LDI r12, 346
LDI r13, 113
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
