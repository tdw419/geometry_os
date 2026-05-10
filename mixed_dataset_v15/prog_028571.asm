; DESCRIPTION: Places a cyan 25x28 rectangle at position (387, 174).
; PLAN: r0=387(x), r1=174(y), r2=25(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 174
LDI r2, 25
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
