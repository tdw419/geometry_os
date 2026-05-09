; DESCRIPTION: Composite: . Then Places a white 34x105 rectangle at position (187, 33). Then Sets a single red pixel at (189, 78).
; PLAN: r0=187(x), r1=33(y), r2=34(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=189(x), r1=78(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white 34x105 rectangle at position (187, 33).
; PLAN: r0=187(x), r1=33(y), r2=34(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 33
LDI r2, 34
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (189, 78).
; PLAN: r0=189(x), r1=78(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 78
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
