; DESCRIPTION: Places a green 98x113 rectangle at position (315, 58).
; PLAN: r0=315(x), r1=58(y), r2=98(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 58
LDI r2, 98
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
