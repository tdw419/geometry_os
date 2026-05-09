; DESCRIPTION: Places a blue 46x116 rectangle at position (298, 60).
; PLAN: r0=298(x), r1=60(y), r2=46(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 60
LDI r2, 46
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
