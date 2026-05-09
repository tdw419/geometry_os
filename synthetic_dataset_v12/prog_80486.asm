; DESCRIPTION: Places a red 49x113 rectangle at position (298, 42).
; PLAN: r0=298(x), r1=42(y), r2=49(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 42
LDI r2, 49
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
