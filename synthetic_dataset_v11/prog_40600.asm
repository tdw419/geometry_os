; DESCRIPTION: Composite: . Then Renders a cyan box of size 68x105 starting at (162, 6). Then Places a red dot at position (193, 206).
; PLAN: r0=162(x), r1=6(y), r2=68(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=193(x), r1=206(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan box of size 68x105 starting at (162, 6).
; PLAN: r0=162(x), r1=6(y), r2=68(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 6
LDI r2, 68
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (193, 206).
; PLAN: r0=193(x), r1=206(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 206
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
