; DESCRIPTION: Composite: Draws a green line from (435, 191) to (487, 213) then Places a cyan 99x51 rectangle at position (228, 63).
; PLAN: r0=435(x1), r1=191(y1), r2=487(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=228(x), r6=63(y), r7=99(width), r8=51(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 191
LDI r2, 487
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 63
LDI r7, 99
LDI r8, 51
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
