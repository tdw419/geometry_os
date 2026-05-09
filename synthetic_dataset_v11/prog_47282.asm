; DESCRIPTION: Composite: . Then Places a cyan dot at position (112, 167). Then Renders a cyan box of size 106x68 starting at (65, 187).
; PLAN: r0=112(x), r1=167(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=65(x), r1=187(y), r2=106(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (112, 167).
; PLAN: r0=112(x), r1=167(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 167
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan box of size 106x68 starting at (65, 187).
; PLAN: r0=65(x), r1=187(y), r2=106(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 187
LDI r2, 106
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
