; DESCRIPTION: Places a yellow 46x33 rectangle at position (298, 142).
; PLAN: r0=298(x), r1=142(y), r2=46(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 142
LDI r2, 46
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
