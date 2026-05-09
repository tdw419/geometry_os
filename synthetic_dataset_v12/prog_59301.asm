; DESCRIPTION: Composite: Draws a black line from (346, 16) to (132, 25) then Renders a cyan disk with center (64, 187) and radius 42.
; PLAN: r0=346(x1), r1=16(y1), r2=132(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=187(y), r7=42(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 346
LDI r1, 16
LDI r2, 132
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 187
LDI r7, 42
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
