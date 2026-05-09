; DESCRIPTION: Composite: . Then Places a green 83x76 rectangle at position (148, 168). Then Renders a magenta line between points (51, 238) and (184, 131).
; PLAN: r0=148(x), r1=168(y), r2=83(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=51(x1), r1=238(y1), r2=184(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green 83x76 rectangle at position (148, 168).
; PLAN: r0=148(x), r1=168(y), r2=83(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 168
LDI r2, 83
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta line between points (51, 238) and (184, 131).
; PLAN: r0=51(x1), r1=238(y1), r2=184(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 238
LDI r2, 184
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
