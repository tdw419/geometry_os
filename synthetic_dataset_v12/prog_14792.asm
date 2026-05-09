; DESCRIPTION: Places a blue 113x55 rectangle at position (298, 65).
; PLAN: r0=298(x), r1=65(y), r2=113(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 65
LDI r2, 113
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
