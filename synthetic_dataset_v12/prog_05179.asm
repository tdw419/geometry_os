; DESCRIPTION: Composite: Places a blue circle of radius 59 at center (383, 144) then Places a magenta 24x56 rectangle at position (368, 70) then Places a cyan dot at position (221, 32).
; PLAN: r0=383(x), r1=144(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=368(x), r6=70(y), r7=24(width), r8=56(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=221(x), r11=32(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 383
LDI r1, 144
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 368
LDI r6, 70
LDI r7, 24
LDI r8, 56
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 32
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
