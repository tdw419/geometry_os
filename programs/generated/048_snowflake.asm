; 048_snowflake.asm -- Snowflake pattern on dark blue background
; 6-fold symmetry using lines from center

; Dark blue background
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 256
LDI r4, 0x000033
RECTF r0, r1, r2, r3, r4

; Line color: ice blue
LDI r5, 0xCCDDFF

; Center = 128, 128
LDI r10, 128
LDI r11, 128

; Main arm length
LDI r12, 80

; --- 6 main arms at 60-degree intervals ---
; We'll draw each arm from center outward with branches

; Arm 0: pointing up (0 deg) -- end at (128, 48)
LDI r0, 128
LDI r1, 128
LDI r2, 128
LDI r3, 48
LINE r0, r1, r2, r3, r5

; Branch left at 1/3 from center: from (128, 95) to (110, 85)
LDI r0, 128
LDI r1, 95
LDI r2, 110
LDI r3, 85
LINE r0, r1, r2, r3, r5

; Branch right at 1/3 from center: from (128, 95) to (146, 85)
LDI r0, 128
LDI r1, 95
LDI r2, 146
LDI r3, 85
LINE r0, r1, r2, r3, r5

; Branch left at 2/3 from center: from (128, 72) to (112, 62)
LDI r0, 128
LDI r1, 72
LDI r2, 112
LDI r3, 62
LINE r0, r1, r2, r3, r5

; Branch right at 2/3 from center: from (128, 72) to (144, 62)
LDI r0, 128
LDI r1, 72
LDI r2, 144
LDI r3, 62
LINE r0, r1, r2, r3, r5

; Arm 1: 60 deg -- end at (197, 88)
; cos(60)=0.5, sin(60)=0.866 => (128+40, 128-69) = (168, 59)
LDI r0, 128
LDI r1, 128
LDI r2, 197
LDI r3, 88
LINE r0, r1, r2, r3, r5

; Branch at 1/3: from (151, 115) to (140, 99)
LDI r0, 151
LDI r1, 115
LDI r2, 140
LDI r3, 99
LINE r0, r1, r2, r3, r5

; Branch at 1/3: from (151, 115) to (167, 108)
LDI r0, 151
LDI r1, 115
LDI r2, 167
LDI r3, 108
LINE r0, r1, r2, r3, r5

; Branch at 2/3: from (174, 101) to (163, 86)
LDI r0, 174
LDI r1, 101
LDI r2, 163
LDI r3, 86
LINE r0, r1, r2, r3, r5

; Branch at 2/3: from (174, 101) to (190, 94)
LDI r0, 174
LDI r1, 101
LDI r2, 190
LDI r3, 94
LINE r0, r1, r2, r3, r5

; Arm 2: 120 deg -- end at (197, 168)
LDI r0, 128
LDI r1, 128
LDI r2, 197
LDI r3, 168
LINE r0, r1, r2, r3, r5

; Branch at 1/3: from (151, 141) to (167, 148)
LDI r0, 151
LDI r1, 141
LDI r2, 167
LDI r3, 148
LINE r0, r1, r2, r3, r5

; Branch at 1/3: from (151, 141) to (140, 157)
LDI r0, 151
LDI r1, 141
LDI r2, 140
LDI r3, 157
LINE r0, r1, r2, r3, r5

; Branch at 2/3: from (174, 155) to (190, 162)
LDI r0, 174
LDI r1, 155
LDI r2, 190
LDI r3, 162
LINE r0, r1, r2, r3, r5

; Branch at 2/3: from (174, 155) to (163, 170)
LDI r0, 174
LDI r1, 155
LDI r2, 163
LDI r3, 170
LINE r0, r1, r2, r3, r5

; Arm 3: 180 deg (pointing down) -- end at (128, 208)
LDI r0, 128
LDI r1, 128
LDI r2, 128
LDI r3, 208
LINE r0, r1, r2, r3, r5

; Branch left at 1/3: from (128, 161) to (110, 171)
LDI r0, 128
LDI r1, 161
LDI r2, 110
LDI r3, 171
LINE r0, r1, r2, r3, r5

; Branch right at 1/3: from (128, 161) to (146, 171)
LDI r0, 128
LDI r1, 161
LDI r2, 146
LDI r3, 171
LINE r0, r1, r2, r3, r5

; Branch left at 2/3: from (128, 184) to (112, 194)
LDI r0, 128
LDI r1, 184
LDI r2, 112
LDI r3, 194
LINE r0, r1, r2, r3, r5

; Branch right at 2/3: from (128, 184) to (144, 194)
LDI r0, 128
LDI r1, 184
LDI r2, 144
LDI r3, 194
LINE r0, r1, r2, r3, r5

; Arm 4: 240 deg -- end at (59, 168)
LDI r0, 128
LDI r1, 128
LDI r2, 59
LDI r3, 168
LINE r0, r1, r2, r3, r5

; Branch at 1/3: from (105, 141) to (88, 148)
LDI r0, 105
LDI r1, 141
LDI r2, 88
LDI r3, 148
LINE r0, r1, r2, r3, r5

; Branch at 1/3: from (105, 141) to (116, 157)
LDI r0, 105
LDI r1, 141
LDI r2, 116
LDI r3, 157
LINE r0, r1, r2, r3, r5

; Branch at 2/3: from (82, 155) to (66, 162)
LDI r0, 82
LDI r1, 155
LDI r2, 66
LDI r3, 162
LINE r0, r1, r2, r3, r5

; Branch at 2/3: from (82, 155) to (93, 170)
LDI r0, 82
LDI r1, 155
LDI r2, 93
LDI r3, 170
LINE r0, r1, r2, r3, r5

; Arm 5: 300 deg -- end at (59, 88)
LDI r0, 128
LDI r1, 128
LDI r2, 59
LDI r3, 88
LINE r0, r1, r2, r3, r5

; Branch at 1/3: from (105, 115) to (88, 108)
LDI r0, 105
LDI r1, 115
LDI r2, 88
LDI r3, 108
LINE r0, r1, r2, r3, r5

; Branch at 1/3: from (105, 115) to (116, 99)
LDI r0, 105
LDI r1, 115
LDI r2, 116
LDI r3, 99
LINE r0, r1, r2, r3, r5

; Branch at 2/3: from (82, 101) to (66, 94)
LDI r0, 82
LDI r1, 101
LDI r2, 66
LDI r3, 94
LINE r0, r1, r2, r3, r5

; Branch at 2/3: from (82, 101) to (93, 86)
LDI r0, 82
LDI r1, 101
LDI r2, 93
LDI r3, 86
LINE r0, r1, r2, r3, r5

; Center circle dot
LDI r0, 128
LDI r1, 128
LDI r2, 4
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3

HALT
