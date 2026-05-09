; DESCRIPTION: Places a white 111x20 rectangle at position (121, 48).
; PLAN: r0=121(x), r1=48(y), r2=111(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 48
LDI r2, 111
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
