; DESCRIPTION: Composite: . Then Draws a cyan line from (194, 250) to (15, 203). Then Places a white 27x77 rectangle at position (141, 166).
; PLAN: r0=194(x1), r1=250(y1), r2=15(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=141(x), r1=166(y), r2=27(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (194, 250) to (15, 203).
; PLAN: r0=194(x1), r1=250(y1), r2=15(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 250
LDI r2, 15
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a white 27x77 rectangle at position (141, 166).
; PLAN: r0=141(x), r1=166(y), r2=27(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 166
LDI r2, 27
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
