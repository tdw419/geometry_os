; DESCRIPTION: Places a yellow 46x20 rectangle at position (183, 202).
; PLAN: r0=183(x), r1=202(y), r2=46(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 202
LDI r2, 46
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
