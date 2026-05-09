; DESCRIPTION: Composite: Places a cyan 100x21 rectangle at position (190, 197) then Draws a green line from (293, 82) to (122, 228).
; PLAN: r0=190(x), r1=197(y), r2=100(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x1), r6=82(y1), r7=122(x2), r8=228(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 197
LDI r2, 100
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 82
LDI r7, 122
LDI r8, 228
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
