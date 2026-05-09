; DESCRIPTION: Composite: . Then Places a green 98x106 rectangle at position (66, 16). Then Renders a red disk with center (177, 242) and radius 11.
; PLAN: r0=66(x), r1=16(y), r2=98(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=177(x), r1=242(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green 98x106 rectangle at position (66, 16).
; PLAN: r0=66(x), r1=16(y), r2=98(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 16
LDI r2, 98
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (177, 242) and radius 11.
; PLAN: r0=177(x), r1=242(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 242
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
