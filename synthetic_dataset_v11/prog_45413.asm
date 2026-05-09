; DESCRIPTION: Composite: . Then Renders a cyan box of size 100x46 starting at (153, 209). Then Places a green dot at position (152, 60).
; PLAN: r0=153(x), r1=209(y), r2=100(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=152(x), r1=60(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan box of size 100x46 starting at (153, 209).
; PLAN: r0=153(x), r1=209(y), r2=100(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 209
LDI r2, 100
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (152, 60).
; PLAN: r0=152(x), r1=60(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 152
LDI r1, 60
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
