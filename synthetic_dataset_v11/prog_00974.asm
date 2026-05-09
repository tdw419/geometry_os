; DESCRIPTION: Composite: . Then Places a magenta 51x68 rectangle at position (186, 67). Then Renders a cyan line between points (177, 188) and (64, 109).
; PLAN: r0=186(x), r1=67(y), r2=51(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=177(x1), r1=188(y1), r2=64(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta 51x68 rectangle at position (186, 67).
; PLAN: r0=186(x), r1=67(y), r2=51(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 67
LDI r2, 51
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan line between points (177, 188) and (64, 109).
; PLAN: r0=177(x1), r1=188(y1), r2=64(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 188
LDI r2, 64
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
