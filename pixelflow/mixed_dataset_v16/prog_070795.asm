; DESCRIPTION: Places a green 98x91 rectangle at position (102, 77).
; PLAN: r0=102(x), r1=77(y), r2=98(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 77
LDI r2, 98
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
