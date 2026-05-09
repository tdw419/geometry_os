; DESCRIPTION: Composite: . Then Renders a cyan line between points (125, 236) and (44, 164). Then Places a orange 14x14 rectangle at position (137, 21).
; PLAN: r0=125(x1), r1=236(y1), r2=44(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=137(x), r1=21(y), r2=14(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan line between points (125, 236) and (44, 164).
; PLAN: r0=125(x1), r1=236(y1), r2=44(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 236
LDI r2, 44
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange 14x14 rectangle at position (137, 21).
; PLAN: r0=137(x), r1=21(y), r2=14(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 21
LDI r2, 14
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
