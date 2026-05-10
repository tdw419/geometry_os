; DESCRIPTION: Composite: Draws a black line from (424, 122) to (228, 239) then Places a cyan 27x120 rectangle at position (271, 56) then Places a magenta dot at position (305, 212).
; PLAN: r0=424(x1), r1=122(y1), r2=228(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=56(y), r7=27(width), r8=120(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=305(x), r11=212(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 424
LDI r1, 122
LDI r2, 228
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 56
LDI r7, 27
LDI r8, 120
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 212
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
