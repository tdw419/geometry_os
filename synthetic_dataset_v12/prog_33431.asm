; DESCRIPTION: Places a yellow 104x102 rectangle at position (125, 46).
; PLAN: r0=125(x), r1=46(y), r2=104(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 46
LDI r2, 104
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
