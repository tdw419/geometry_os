; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (73, 195) to (169, 200). Then Renders a magenta box of size 75x48 starting at (146, 31).
; PLAN: r0=73(x1), r1=195(y1), r2=169(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=146(x), r1=31(y), r2=75(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan line segment connecting (73, 195) to (169, 200).
; PLAN: r0=73(x1), r1=195(y1), r2=169(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 195
LDI r2, 169
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta box of size 75x48 starting at (146, 31).
; PLAN: r0=146(x), r1=31(y), r2=75(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 31
LDI r2, 75
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
