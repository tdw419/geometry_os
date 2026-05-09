; DESCRIPTION: Composite: Draws a cyan line from (9, 63) to (224, 39) then Places a purple dot at position (20, 57) then Places a green 32x95 rectangle at position (446, 118).
; PLAN: r0=9(x1), r1=63(y1), r2=224(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=57(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=446(x), r11=118(y), r12=32(width), r13=95(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 9
LDI r1, 63
LDI r2, 224
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 57
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 446
LDI r11, 118
LDI r12, 32
LDI r13, 95
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
