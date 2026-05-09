; DESCRIPTION: Composite: . Then Places a green dot at position (207, 193). Then Renders a cyan box of size 48x117 starting at (69, 43).
; PLAN: r0=207(x), r1=193(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=69(x), r1=43(y), r2=48(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (207, 193).
; PLAN: r0=207(x), r1=193(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 207
LDI r1, 193
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan box of size 48x117 starting at (69, 43).
; PLAN: r0=69(x), r1=43(y), r2=48(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 43
LDI r2, 48
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
