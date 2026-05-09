; DESCRIPTION: Composite: . Then Sets a single black pixel at (154, 88). Then Renders a cyan box of size 65x11 starting at (115, 236).
; PLAN: r0=154(x), r1=88(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=115(x), r1=236(y), r2=65(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (154, 88).
; PLAN: r0=154(x), r1=88(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 88
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a cyan box of size 65x11 starting at (115, 236).
; PLAN: r0=115(x), r1=236(y), r2=65(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 236
LDI r2, 65
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
