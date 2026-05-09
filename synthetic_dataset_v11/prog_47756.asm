; DESCRIPTION: Composite: . Then Renders a magenta line between points (154, 223) and (23, 3). Then Places a black 92x115 rectangle at position (42, 48).
; PLAN: r0=154(x1), r1=223(y1), r2=23(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=42(x), r1=48(y), r2=92(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta line between points (154, 223) and (23, 3).
; PLAN: r0=154(x1), r1=223(y1), r2=23(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 223
LDI r2, 23
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black 92x115 rectangle at position (42, 48).
; PLAN: r0=42(x), r1=48(y), r2=92(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 48
LDI r2, 92
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
