; DESCRIPTION: Places a yellow 104x19 rectangle at position (284, 46).
; PLAN: r0=284(x), r1=46(y), r2=104(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 46
LDI r2, 104
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
