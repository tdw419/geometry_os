; DESCRIPTION: Places a cyan 70x43 rectangle at position (125, 29).
; PLAN: r0=125(x), r1=29(y), r2=70(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 29
LDI r2, 70
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
