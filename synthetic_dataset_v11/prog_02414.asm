; DESCRIPTION: Renders a cyan line between points (239, 39) and (255, 174).
; PLAN: r0=239(x1), r1=39(y1), r2=255(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 39
LDI r2, 255
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
