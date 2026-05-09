; DESCRIPTION: Places a yellow 46x111 rectangle at position (295, 74).
; PLAN: r0=295(x), r1=74(y), r2=46(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 74
LDI r2, 46
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
