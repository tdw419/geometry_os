; DESCRIPTION: Composite: . Then Renders a cyan box of size 65x113 starting at (138, 139). Then Places a yellow dot at position (218, 58).
; PLAN: r0=138(x), r1=139(y), r2=65(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=218(x), r1=58(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan box of size 65x113 starting at (138, 139).
; PLAN: r0=138(x), r1=139(y), r2=65(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 139
LDI r2, 65
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (218, 58).
; PLAN: r0=218(x), r1=58(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 218
LDI r1, 58
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
